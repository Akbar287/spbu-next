"use client";

import * as React from "react";
import { type LucideIcon } from "lucide-react";
import { NavMain } from "@/components/nav-main";
import { NavUser } from "@/components/nav-user";
import { TeamSwitcher } from "@/components/team-switcher";
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarHeader,
    SidebarRail,
} from "@/components/ui/sidebar";
import { RoleMenuProps } from "@/model/RoleMenu";

interface AppSidebarProps {
    teams: RoleMenuProps[];
    activeTeam: RoleMenuProps;
    selectSpbu: (team: RoleMenuProps) => void;
    user: {
        name: string;
        email: string;
        avatar: string;
    };
}

export function AppSidebar({
    teams,
    activeTeam,
    selectSpbu,
    user,
    ...props
}: AppSidebarProps & React.ComponentProps<typeof Sidebar>) {
    return (
        <Sidebar variant="inset" collapsible="icon" {...props}>
            <SidebarHeader>
                <TeamSwitcher
                    teams={teams}
                    activeTeam={activeTeam}
                    selectSpbu={selectSpbu}
                />
            </SidebarHeader>
            <SidebarContent>
                <NavMain items={activeTeam.menu} />
            </SidebarContent>
            <SidebarFooter>
                <NavUser user={user} />
            </SidebarFooter>
            <SidebarRail />
        </Sidebar>
    );
}
