import { RoleMenuProps, RoleMenuValue } from "@/model/RoleMenu";
import { createZustandStore } from "nes-zustand";

// Create a store
export const activeMenuStore = createZustandStore<RoleMenuProps>({
    key: "activeMenuStore",
    default: RoleMenuValue,
});
