function validateRequired(form) {
    const fields = form.querySelectorAll("input[required], textarea[required], select[required]");
    for (const field of fields) {
        if (!field.value.trim()) {
            alert("Please fill all required fields.");
            field.focus();
            return false;
        }
    }
    return true;
}
