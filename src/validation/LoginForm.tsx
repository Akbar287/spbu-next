import * as yup from "yup";

export const LoginFormValidation = yup.object().shape({
    username: yup.string().required("Username wajib diisi"), // Validasi username
    password: yup
        .string()
        .required("Password wajib diisi")
        .min(6, "Password minimal 6 karakter"),
});
