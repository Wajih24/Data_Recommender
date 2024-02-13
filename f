else if (strcmp(cmd, "read_bin") == 0) {
    if (log == NULL) {
        scanf("%s", fileName); // Read the file name from user input
        if (strstr(fileName, ".bin") != NULL) {
            log = read_contacts_log_from_binary(fileName); // Use the fileName variable
            if (log != NULL) {
                printf("Contacts log loaded from binary file\n");
            } else {
                printf("Failed to read contacts log from binary file\n");
            }
        } else {
            printf("Error: Unknown contacts log file extension\n");
        }
    } else {
        printf("Error: You must clear current contacts log first\n");
    }
}
