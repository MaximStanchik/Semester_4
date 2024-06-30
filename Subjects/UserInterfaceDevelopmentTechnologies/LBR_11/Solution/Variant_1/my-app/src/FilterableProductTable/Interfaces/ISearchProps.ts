export interface ISearchProps {
    filter: string;
    availability: boolean;
    onFilterChanged: (x: string) => void;
    onAvailabilityChanged: (x: boolean) => void;
  };