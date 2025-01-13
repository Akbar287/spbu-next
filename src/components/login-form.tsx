import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import Image from "next/image";
import ImageData from "@/asset/images/622370d130598.jpg";
import { signIn } from "next-auth/react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { LoginFormValidation } from "@/validation/LoginForm";
import React from "react";
import { LogInIcon } from "lucide-react";
import { Alert, AlertDescription, AlertTitle } from "./ui/alert";
import { useRouter } from "next/router";

interface LoginFormProps {
    username: string;
    password: string;
}

export function LoginForm({
    className,
    ...props
}: React.ComponentProps<"div">) {
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm<LoginFormProps>({
        resolver: yupResolver(LoginFormValidation),
    });
    const router = useRouter();
    const [errorMessage, setErrorMessage] = React.useState<string | null>(null);

    const onSubmit = async (data: LoginFormProps) => {
        const result = await signIn("credentials", {
            username: data.username,
            password: data.password,
            redirect: false,
            callbackUrl: "/",
        });

        if (result?.error) {
            setErrorMessage(result.error);
        }

        if (result?.ok) {
            setErrorMessage(null);
            router.push("/");
        }
    };

    React.useEffect(() => {
        if (router.query.msg) {
            setErrorMessage(router.query.msg as string);
        }
    }, []);

    return (
        <div className={cn("flex flex-col gap-6", className)} {...props}>
            <Card className="overflow-hidden">
                <CardContent className="grid p-0 md:grid-cols-2">
                    <form
                        className="p-6 md:p-8"
                        onSubmit={handleSubmit(onSubmit)}
                    >
                        <div className="flex flex-col gap-6">
                            <div className="flex flex-col items-center text-center">
                                <h1 className="text-2xl font-bold">
                                    Selamat Datang
                                </h1>
                                <p className="text-balance text-muted-foreground">
                                    Masuk menggunakan akun anda
                                </p>
                            </div>
                            {errorMessage && (
                                <Alert
                                    variant="destructive"
                                    className="bg-red-500 text-white"
                                >
                                    <LogInIcon className="h-4 w-4" />
                                    <AlertTitle>Kesalahan</AlertTitle>
                                    <AlertDescription>
                                        {errorMessage}
                                    </AlertDescription>
                                </Alert>
                            )}
                            <div className="grid gap-2">
                                <Label htmlFor="email">Nama Akun</Label>
                                <Input
                                    id="username"
                                    type="text"
                                    {...register("username")}
                                    placeholder="Nama Akun Anda"
                                />
                                {errors.username && (
                                    <p style={{ color: "red" }}>
                                        {errors.username.message}
                                    </p>
                                )}
                            </div>
                            <div className="grid gap-2">
                                <div className="flex items-center">
                                    <Label htmlFor="password">Kata Sandi</Label>
                                </div>
                                <Input
                                    id="password"
                                    {...register("password")}
                                    type="password"
                                />
                                {errors.password && (
                                    <p style={{ color: "red" }}>
                                        {errors.password.message}
                                    </p>
                                )}
                            </div>
                            <Button type="submit" className="w-full">
                                Login
                            </Button>
                            <div className="text-sm text-center">
                                Beritahu Admin jika ada masalah
                            </div>
                        </div>
                    </form>
                    <div className="relative hidden bg-muted md:block">
                        <Image
                            src={ImageData}
                            className="absolute inset-0 h-full w-full object-cover dark:brightness-[0.7] dark:grayscale"
                            alt="Image"
                            fill
                            priority
                            sizes="100vw"
                        />
                    </div>
                </CardContent>
            </Card>
            <div className="text-balance text-center text-xs text-muted-foreground [&_a]:underline [&_a]:underline-offset-4 hover:[&_a]:text-primary">
                Sistem Informasi Monitoring SPBU &copy;{" "}
                {new Date().getFullYear()}
            </div>
        </div>
    );
}
