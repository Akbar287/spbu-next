import { useEffect, useState } from "react";

/**
 * Custom hook to check if a specific media query matches.
 * @param query - The media query string (e.g., '(min-width: 768px)')
 * @returns Boolean - Whether the media query matches or not
 */
export function useMediaQuery(query: string): boolean {
  const [matches, setMatches] = useState(false);

  useEffect(() => {
    // Create a MediaQueryList object
    const mediaQueryList = window.matchMedia(query);

    // Set the initial state
    setMatches(mediaQueryList.matches);

    // Listener function to update state when media query changes
    const handleChange = (event: MediaQueryListEvent) => {
      setMatches(event.matches);
    };

    // Attach the listener
    mediaQueryList.addEventListener("change", handleChange);

    // Cleanup listener on unmount
    return () => mediaQueryList.removeEventListener("change", handleChange);
  }, [query]);

  return matches;
}
