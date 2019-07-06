#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

void read_arg(char * in, int * in_pos, int in_len, char * out, int * out_pos);
int instr(char ch, char * str);
int read_sep(char * in, int * in_pos, int in_len, char * out, int * out_pos);

#define ENV_TYPE_BATCH 0
#define ENV_TYPE_CMDSHELL 1
#define ENV_TYPE_DEFAULT ENV_TYPE_BATCH
int env_type = ENV_TYPE_DEFAULT;

#define CALL_TYPE_BATCH 0
#define CALL_TYPE_OTHER 1
#define CALL_TYPE_DEFAULT CALL_TYPE_BATCH
int call_type = CALL_TYPE_DEFAULT;

int main(int argc, char **argv, char **envp) {
    LPTSTR cmd  = GetCommandLine();

    //printf("%s\n", cmd);
    //for (int i = 0; i < argc; i++) {
    //    printf("%s\n", argv[i]);
    //}

    char * opts = 0;
    int it = 0;
    while (envp[it++] != 0) {
        char * var = envp[it-1];
        //printf("%s\n", envp[it++]);
        int eq_sign = instr('=', var);
        if (eq_sign == 8 && strnicmp(var, "eat_opts", 8) == 0) {
            opts = &var[9];
        }
    }

    // read options
    if (opts) {
        //printf("opts: %s\n", opts);
        env_type = strstr("-eB", opts) ? ENV_TYPE_BATCH :
                   strstr("-eC", opts) ? ENV_TYPE_CMDSHELL :
                   ENV_TYPE_DEFAULT;

        call_type = strstr("-cB", opts) ? CALL_TYPE_BATCH :
                    strstr("-cO", opts) ? CALL_TYPE_OTHER :
                    CALL_TYPE_DEFAULT;
    }

    // reading program name
    int len = strlen(cmd);
    char * out = malloc(sizeof(char) * len * 4 + 1);
    int r = 0, w = 0;
    read_arg(cmd, &r, len, out, &w);

    // must have a space after program name
    if (cmd[r++] != ' ') {
        fprintf(stderr, "ERROR: should be space");
        return 1;
    }

    read_sep(cmd, &r, len, 0, 0);

    if (r == len) {
        fprintf(stderr, "ERROR: no arguments");
        return 1;
    }

    // reading arg 1 (will be ignored)
    w = 0;
    read_arg(cmd, &r, len, out, &w);

    read_sep(cmd, &r, len, 0, 0);

    // reading other args and printing them
    w = 0;
    while (1) {
        read_arg(cmd, &r, len, out, &w);
        read_sep(cmd, &r, len, out, &w);
        if (r == len)
            break;
    }
    printf("%s", out);
    
    free(out);
    return 0;
}

int read_sep(char * in, int * in_pos, int in_len, char * out, int * out_pos) {
    int p = *in_pos;
    int i;
    char * sep = call_type == CALL_TYPE_BATCH ? " ,=" : " ";
    for (i = 0; p + i < in_len; i++) {
        if (instr(in[p + i], sep) < 0)
            break;
        else if (out && out_pos) {
            out[(*out_pos)++] = in[p + i];
        }
    }
    if (out && out_pos)
        out[*out_pos] = '\0';
    *in_pos = p + i;
    return i;
}

void read_arg(char * in, int * in_pos, int in_len, char * out, int * out_pos) {
    int context = 0;
    int o = *out_pos;
    int p;
    char * sep = call_type == CALL_TYPE_BATCH ? " ,=" : " ";
    for (p = *in_pos; p < in_len; p++) {
        char ch = in[p];

        // deciding context
        if (context == 0 && ch == '"') context = 1;
        else if (context == 1 && ch == '"') context = 0;

        // interpreting chars in context 0
        if (context == 0) {
            if (instr(ch, "^&<>|") >= 0) {
                out[o++] = '^';
                out[o++] = ch;
            }
            else if (ch == '%') {
                out[o++] = env_type == ENV_TYPE_BATCH ? '%' : '^';
                out[o++] = '%';
            }
            else if (instr(ch, sep) >= 0) break;
            else out[o++] = ch;
        }
        
        // interpreting chars in context 1
        if (context == 1) {
            out[o++] = ch;
        }
    }

    out[o] = '\0';
    *out_pos = o;
    *in_pos = p;
}

int instr(char ch, char * str) {
    int len = strlen(str);
    for (int i = 0; i < len; i++)
        if (str[i] == ch)
            return i;
    return -1;
}