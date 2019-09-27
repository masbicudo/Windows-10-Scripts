#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <windows.h>
#include <libgen.h>

int main (int argc, char *argv[]) {
    char *target = "shortcut-create.cmd";
    int verbose = FALSE;

    for (int it = 1; it < argc; it++)
    {
        if (strcmpi(argv[it], "--version") == 0)
        {
            printf("shortcut-create.exe v0.0.1");
            return 0;
        }
        if (strcmpi(argv[it], "--verbose") == 0)
        {
            verbose = TRUE;
        }
    }

    char *exe_fullpath, *exe_dirname, *exe_filename;
    {
        char path[10240];
        int exe_name_length = GetModuleFileName(0, path, 10240 - 1);

        exe_fullpath = malloc(sizeof(char) * (exe_name_length + 1));
        exe_dirname = malloc(sizeof(char) * (exe_name_length + 1));
        exe_filename = malloc(sizeof(char) * (exe_name_length + 1));
        strncpy(exe_fullpath, path, exe_name_length);
        strncpy(exe_dirname, path, exe_name_length);
        strncpy(exe_filename, path, exe_name_length);
        exe_fullpath[exe_name_length] = 0;
        exe_dirname[exe_name_length] = 0;
        exe_filename[exe_name_length] = 0;
    }

    exe_dirname = dirname(exe_dirname);
    exe_filename = basename(exe_filename);

    int exe_dirname_len = strlen(exe_dirname);
    int exe_filename_len = strlen(exe_filename);

    int target_len = strlen(target);
    int max_len = exe_dirname_len + 1 + target_len;
    for (int it = 1; it < argc; it++)
    {
        // each char may need an escape char, and the string may need '"' surrounding it
        max_len += 3 + 2*strlen(argv[it]);
    }

    char *command = malloc(sizeof(char) * (max_len + 1));
    strncpy(command, exe_dirname, exe_dirname_len);
    command[exe_dirname_len] = '\\';
    strncpy(command + exe_dirname_len + 1, target, target_len);
    int pos = exe_dirname_len + 1 + target_len;
    for (int it = 1; it < argc; it++)
    {
        int len = strlen(argv[it]);
        command[pos] = ' ';
        if (len == 0 || strchr(argv[it], ' ') != NULL)
        {
            command[pos + 1] = '"';
            strncpy(command + pos + 2, argv[it], len);
            command[pos + 2 + len] = '"';
            pos += len + 3;
        }
        else
        {
            strncpy(command + pos + 1, argv[it], len);
            pos += len + 1;
        }
    }
    command[pos] = 0;
    
    if (verbose) printf("%s\n", command);
    system(command);

    free(exe_fullpath);
    free(exe_dirname);
    free(exe_filename);

    return 0;
}
