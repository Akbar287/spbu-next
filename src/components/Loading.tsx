// components/Loading.tsx
import { cn } from "@/lib/utils";

const Loading = ({ visible = true }: { visible: boolean }) => {
    if (!visible) return null;

    return (
        <div
            className={cn(
                "fixed bottom-4 right-4 flex items-center justify-center bg-white dark:bg-gray-800 rounded-full shadow-lg p-4",
                "border border-gray-200 dark:border-gray-700"
            )}
        >
            <svg
                className="animate-spin h-6 w-6 text-blue-500"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
            >
                <circle
                    className="opacity-25"
                    cx="12"
                    cy="12"
                    r="10"
                    stroke="currentColor"
                    strokeWidth="4"
                ></circle>
                <path
                    className="opacity-75"
                    fill="currentColor"
                    d="M4 12a8 8 0 018-8v8H4z"
                ></path>
            </svg>
            <span className="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">
                Loading...
            </span>
        </div>
    );
};

export default Loading;
