export interface RoleMenuProps {
    name: string;
    logo: string;
    plan: string;
    menu: {
        title: string;
        url: string;
        icon: string;
        items?: {
            title: string;
            url: string;
        }[];
    }[];
}

export const RoleMenuValue: RoleMenuProps = {
    name: "",
    logo: "",
    plan: "",
    menu: [],
};
