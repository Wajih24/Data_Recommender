char log_name[MAX_NAME_LEN];
char *dot = strrchr(file_name, '.');
if (dot && strcmp(dot, ".txt") == 0) {
    size_t name_length = dot - file_name;
    strncpy(log_name, file_name, name_length);
    log_name[name_length] = '\0'; // Ensure null-termination
} else {
    strcpy(log_name, file_name); // Use the original file_name if no .txt extension
}

contacts_log_t *log = create_contacts_log(log_name);
