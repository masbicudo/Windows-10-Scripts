#include <stdio.h>
#include <stdlib.h>

#ifdef _WIN32
#include <windows.h>
#ifndef ENABLE_VIRTUAL_TERMINAL_PROCESSING
#define ENABLE_VIRTUAL_TERMINAL_PROCESSING  0x0004
#endif
#ifndef DISABLE_NEWLINE_AUTO_RETURN
#define DISABLE_NEWLINE_AUTO_RETURN  0x0008
#endif
#ifndef ENABLE_WRAP_AT_EOL_OUTPUT
#define ENABLE_WRAP_AT_EOL_OUTPUT  0x0002
#endif
void set_console_mode() {
  HANDLE stdoutHandle = GetStdHandle(STD_OUTPUT_HANDLE);
  DWORD outMode;
  GetConsoleMode(stdoutHandle, &outMode);
  outMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
  outMode |= DISABLE_NEWLINE_AUTO_RETURN;
  outMode &= ~ENABLE_WRAP_AT_EOL_OUTPUT;
  SetConsoleMode(stdoutHandle, outMode);
}
#else
void set_console_mode() { }
#endif

void read_arg(char *in, int *in_pos, int in_len, char *out, int *out_pos);
int instr(char ch, char *str);
int read_sep(char *in, int *in_pos, int in_len, char *out, int *out_pos);

#define ENV_TYPE_BATCH 0
#define ENV_TYPE_CMDSHELL 1
#define ENV_TYPE_DEFAULT ENV_TYPE_BATCH
int env_type = ENV_TYPE_DEFAULT;

#define CALL_TYPE_BATCH 0
#define CALL_TYPE_OTHER 1
#define CALL_TYPE_DEFAULT CALL_TYPE_BATCH
int call_type = CALL_TYPE_DEFAULT;

int main(int argc, char **argv, char **envp)
{
    set_console_mode();

    LPTSTR cmd = GetCommandLine();

    // Getting env var __IND
    char *indent = 0;
    int it = 0;
    while (envp[it++] != 0)
    {
        char *var = envp[it - 1];
        int eq_sign = instr('=', var);
        if (eq_sign == 5 && strnicmp(var, "__IND", 5) == 0)
            indent = var + 6;
    }

    char *eol = "\n";

    // reading program name
    int len = strlen(cmd);
    char *out = malloc(sizeof(char) * len * 4 + 1);
    int r = 0, w = 0;
    read_arg(cmd, &r, len, out, &w);

    if (cmd[r++] != ' ')
    {
        printf("%s%s", indent ? indent : "", eol);
        return 0;
    }

    char *sep = call_type == CALL_TYPE_BATCH ? " ,=" : " ";
    if (cmd[r++] == 0)
    {
        printf("%s%s", indent ? indent : "", eol);
        return 0;
    }

    printf("%s%s%s", indent ? indent : "", cmd + r, eol);

    return 0;
}

void read_arg(char *in, int *in_pos, int in_len, char *out, int *out_pos)
{
    int context = 0;
    int o = *out_pos;
    int p;
    char *sep = call_type == CALL_TYPE_BATCH ? " ,=" : " ";
    for (p = *in_pos; p < in_len; p++)
    {
        char ch = in[p];

        // deciding context
        if (context == 0 && ch == '"')
            context = 1;
        else if (context == 1 && ch == '"')
            context = 0;

        // interpreting chars in context 0
        if (context == 0)
        {
            if (instr(ch, "^&<>|") >= 0)
            {
                out[o++] = '^';
                out[o++] = ch;
            }
            else if (ch == '%')
            {
                out[o++] = env_type == ENV_TYPE_BATCH ? '%' : '^';
                out[o++] = '%';
            }
            else if (instr(ch, sep) >= 0)
                break;
            else
                out[o++] = ch;
        }

        // interpreting chars in context 1
        if (context == 1)
        {
            out[o++] = ch;
        }
    }

    out[o] = '\0';
    *out_pos = o;
    *in_pos = p;
}

int instr(char ch, char *str)
{
    int len = strlen(str);
    for (int i = 0; i < len; i++)
        if (str[i] == ch)
            return i;
    return -1;
}