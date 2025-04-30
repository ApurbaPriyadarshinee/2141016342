#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid = fork(); // Create a new process

    if (pid < 0) {
        // Fork failed
        perror("fork failed");
        return 1;
    } else if (pid == 0) {
        // Child process
        printf("Child: Executing 'ls' command...\n");
        char *args[] = {"ls", "-l", NULL};
        execvp(args[0], args); // Replace child with ls
        perror("exec failed"); // Only runs if execvp fails
    } else {
        // Parent process
        int status;
        wait(&status); // Wait for child to finish
        printf("Parent: Child process completed.\n");
    }

    return 0;
}
