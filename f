int write_contacts_log_to_binary(const contacts_log_t *log) {
    char file_name[MAX_NAME_LEN + 5]; // +5 for ".bin" and null terminator
    snprintf(file_name, sizeof(file_name), "%s.bin", log->log_name);

    FILE *file = fopen(file_name, "wb");
    if (!file) {
        return -1;
    }

    // Write log size first
    fwrite(&log->size, sizeof(log->size), 1, file);

    for (int i = 0; i < NUM_BUCKETS; i++) {
        for (node_t *current = log->buckets[i]; current != NULL; current = current->next) {
            // Write each field of node_t individually
            fwrite(current->name, sizeof(current->name), 1, file);
            fwrite(&current->phone_number, sizeof(current->phone_number), 1, file);
            fwrite(&current->zip_code, sizeof(current->zip_code), 1, file);
        }
    }

    fclose(file);
    return 0;
}
