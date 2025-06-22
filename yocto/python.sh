# ==============================================================================
#  Python 3 Debug Wrapper for Bashdb (v2)
#
#  这个脚本作为 python3 的包装器。它通过检查 'Dbg_DEBUGGER_LEVEL' 环境变量
#  来判断自身是否在 bashdb 调试会话中运行。只有当它在 bashdb 会话中被调用，
#  并且调用的是一个 Python 脚本文件时，它才会自动附加 debugpy 调试参数。
# source "$(dirname ${BASH_SOURCE[0]})/python.sh"
# ==============================================================================
function python() {
    # 定义调试器所需的参数
    DEBUG_ARGS="-m debugpy --listen 0.0.0.0:5678 --wait-for-client"

    # --- 主要逻辑 ---

    # 1. 检查我们是否在 bashdb 会话中运行。
    #    bashdb 会设置 _Dbg_DEBUGGER_LEVEL 环境变量为一个数字，表示调试的嵌套级别。
    #    我们使用 `[ -n "$VAR" ]` 来检查这个变量是否被设置且不为空。
    if [ -n "${_Dbg_DEBUGGER_LEVEL}" ]; then
        # 在 bashdb 会话中。
        # >&2 是为了将提示信息输出到标准错误，以免干扰脚本的正常输出
        echo "--- Python Wrapper: Bashdb session detected (_Dbg_DEBUGGER_LEVEL=${_Dbg_DEBUGGER_LEVEL}). ---" >&2

        # 2. 现在，我们应用之前的逻辑：检查第一个参数是否为脚本文件。
        if [ "$#" -gt 0 ]; then
            case "$1" in
                -*)
                    # 第一个参数是选项 (例如 -m, -c, --version)。
                    # 即使在 bashdb 中，我们也不为这类调用附加 python 调试器。
                    echo "--- Python Wrapper: Option ('$1') found. Passing through without debugpy. ---" >&2
                    env python3 "$@"
                    ;;
                *)
                    # 第一个参数不是选项，我们假定它是一个脚本文件。
                    # 这是我们期望附加调试器的场景！
                    echo "--- Python Wrapper: Script file ('$1') found. Activating debugpy. ---" >&2
                    echo "Waiting for Python debugger (debugpy) to attach on port 5678..." >&2
                    env python3 $DEBUG_ARGS "$@"
                    echo "--- Python Wrapper: Script file ('$1') debugpy end. ---" >&2
                    ;;
            esac
        else
            # 没有提供任何参数 (启动 REPL)。
            # 即使在 bashdb 中，我们也不为 REPL 附加调试器。
            echo "--- Python Wrapper: REPL mode detected. Passing through without debugpy. ---" >&2
            env python3 "$@"
        fi
    else
        # 不在 bashdb 会话中 (Dbg_DEBUGGER_LEVEL 未设置)。
        # 这是最常见的情况。直接、无声地执行原始的 python3，然后退出。
        env python3 "$@"
    fi
}

python3=python

