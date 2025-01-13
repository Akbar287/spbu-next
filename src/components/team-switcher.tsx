"use client";

import * as React from "react";
import { ChevronsUpDown } from "lucide-react";
import DOMPurify from "dompurify";
import { useRouter } from "next/router";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuShortcut,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import {
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
    useSidebar,
} from "@/components/ui/sidebar";
import { RoleMenuProps } from "@/model/RoleMenu";

export function TeamSwitcher({
    teams,
    activeTeam,
    selectSpbu,
}: {
    teams: RoleMenuProps[];
    activeTeam: {
        name: string;
        logo: string;
        plan: string;
    };
    selectSpbu: (team: RoleMenuProps) => void;
}) {
    const { isMobile } = useSidebar();
    const router = useRouter();

    return (
        <SidebarMenu>
            <SidebarMenuItem>
                <DropdownMenu>
                    <DropdownMenuTrigger asChild>
                        <SidebarMenuButton
                            size="lg"
                            className="data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground"
                        >
                            <div className="flex items-center justify-center rounded-lg aspect-square size-8 bg-sidebar-primary text-sidebar-primary-foreground">
                                <span
                                    dangerouslySetInnerHTML={{
                                        __html: DOMPurify.sanitize(
                                            activeTeam.logo
                                        ),
                                    }}
                                />
                            </div>
                            <div className="grid flex-1 text-sm leading-tight text-left">
                                <span className="font-semibold truncate">
                                    {activeTeam.name}
                                </span>
                                <span className="text-xs truncate">
                                    {activeTeam.plan}
                                </span>
                            </div>
                            <ChevronsUpDown className="ml-auto" />
                        </SidebarMenuButton>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent
                        className="w-[--radix-dropdown-menu-trigger-width] min-w-56 rounded-lg"
                        align="start"
                        side={isMobile ? "bottom" : "right"}
                        sideOffset={4}
                    >
                        <DropdownMenuLabel className="text-xs text-muted-foreground">
                            Peran
                        </DropdownMenuLabel>
                        {teams.map((team, index) => (
                            <DropdownMenuItem
                                key={index}
                                onClick={() => {
                                    selectSpbu(team);
                                    router.push(team.menu[0].url);
                                }}
                                className="gap-2 p-2"
                            >
                                <div className="flex items-center justify-center border rounded-sm size-6">
                                    <span
                                        dangerouslySetInnerHTML={{
                                            __html: DOMPurify.sanitize(
                                                team.logo
                                            ),
                                        }}
                                    />
                                </div>
                                {team.name} - {team.plan}
                                <DropdownMenuShortcut>
                                    ⌘{index + 1}
                                </DropdownMenuShortcut>
                            </DropdownMenuItem>
                        ))}
                    </DropdownMenuContent>
                </DropdownMenu>
            </SidebarMenuItem>
        </SidebarMenu>
    );
}
