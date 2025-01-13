import { ProfileProps, ProfileValue } from "@/model/Profile";
import { createZustandStore } from "nes-zustand";

// Create a store
export const authStore = createZustandStore<ProfileProps>({
    key: "authStore",
    default: ProfileValue,
});
