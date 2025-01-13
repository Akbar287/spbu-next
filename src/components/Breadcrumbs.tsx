"use client";

import * as React from "react";
import {
    Breadcrumb,
    BreadcrumbItem,
    BreadcrumbList,
    BreadcrumbSeparator,
} from "@/components/ui/breadcrumb";
import Link from "next/link";
import { useRouter } from "next/router";

const BreadcrumbResponsive: React.FC = () => {
    const router = useRouter();
    const pathnames = router.pathname.split("/").filter((x) => x);

    const getBreadcrumbName = (pathname: string) => {
        if (pathname == "/") return "Home";
        return pathname
            .split("-")
            .map((word) => word.charAt(0).toUpperCase() + word.slice(1)) // Capitalize each word
            .join(" ");
    };

    let breadcrumbsVar = [
        { href: "/", label: "Home" },
        ...pathnames.map((_, index) => {
            const href = "/" + pathnames.slice(0, index + 1).join("/");
            const label = getBreadcrumbName(pathnames[index]);
            return { href, label };
        }),
    ];

    return (
        <Breadcrumb>
            <BreadcrumbList>
                {breadcrumbsVar.map((item, index) => (
                    <React.Fragment key={index}>
                        <BreadcrumbItem key={index}>
                            <Link href={item.href ? item.href : "/"}>
                                {item.label}
                            </Link>
                        </BreadcrumbItem>
                        {index < breadcrumbsVar.length - 1 && (
                            <BreadcrumbSeparator />
                        )}
                    </React.Fragment>
                ))}
            </BreadcrumbList>
        </Breadcrumb>
    );
};

export default BreadcrumbResponsive;
