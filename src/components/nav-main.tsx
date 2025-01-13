"use client";

import DOMPurify from "dompurify";
import Link from "next/link";

import {
    SidebarGroup,
    SidebarGroupLabel,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
    SidebarMenuSub,
    SidebarMenuSubButton,
    SidebarMenuSubItem,
} from "@/components/ui/sidebar";
import React from "react";

export function NavMain({
    items,
}: {
    items: {
        title: string;
        url: string;
        icon?: string;
        isActive?: boolean;
        items?: {
            title: string;
            url: string;
        }[];
    }[];
}) {
    const activeItemRef = React.useRef<HTMLSpanElement | null>(null);

    React.useEffect(() => {
        if (activeItemRef.current) {
            activeItemRef.current.scrollIntoView({
                behavior: "smooth", // Optional: smooth scrolling
                block: "center", // Scroll to the center of the container
            });
        }
    }, [items]); // Re-run when menuItems change

    return (
        <SidebarGroup>
            <SidebarGroupLabel>Menu</SidebarGroupLabel>
            <SidebarMenu>
                {items.map((item) => {
                    let active =
                        item.url.replace("/", "") ==
                        window.location.pathname.split("/").pop();
                    return item.items == null ? (
                        <SidebarMenuItem key={item.title}>
                            <SidebarMenuButton isActive={active} asChild>
                                <Link href={item.url}>
                                    {item.icon && (
                                        <span
                                            dangerouslySetInnerHTML={{
                                                __html: DOMPurify.sanitize(
                                                    item.icon
                                                ),
                                            }}
                                        />
                                    )}
                                    <span ref={active ? activeItemRef : null}>
                                        {item.title}
                                    </span>
                                </Link>
                            </SidebarMenuButton>
                        </SidebarMenuItem>
                    ) : (
                        <SidebarMenuItem key={item.title}>
                            <SidebarMenuButton isActive={active} asChild>
                                <Link href={item.url}>
                                    {item.icon && (
                                        <span
                                            dangerouslySetInnerHTML={{
                                                __html: DOMPurify.sanitize(
                                                    item.icon
                                                ),
                                            }}
                                        />
                                    )}
                                    <span ref={active ? activeItemRef : null}>
                                        {item.title}
                                    </span>
                                </Link>
                            </SidebarMenuButton>
                            {item.items?.length ? (
                                <SidebarMenuSub>
                                    {item.items.map((item2) => {
                                        let active2 =
                                            item2.url.split("/").pop() ==
                                            window.location.pathname
                                                .split("/")
                                                .pop();
                                        return (
                                            <SidebarMenuSubItem
                                                key={item2.title}
                                            >
                                                <SidebarMenuSubButton
                                                    isActive={active2}
                                                    asChild
                                                >
                                                    <Link href={item2.url}>
                                                        <span
                                                            ref={
                                                                active2
                                                                    ? activeItemRef
                                                                    : null
                                                            }
                                                        >
                                                            {item2.title}
                                                        </span>
                                                    </Link>
                                                </SidebarMenuSubButton>
                                            </SidebarMenuSubItem>
                                        );
                                    })}
                                </SidebarMenuSub>
                            ) : null}
                        </SidebarMenuItem>
                    );
                })}
            </SidebarMenu>
        </SidebarGroup>
    );
}
