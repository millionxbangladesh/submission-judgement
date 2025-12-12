import {format} from 'date-fns';

export default function useHelper() {
    const formatDate = (dateString) => {
        const date = new Date(dateString);
        const day = date.getDate();
        const month = format(date, 'MMM');
        const year = date.getFullYear();
        const suffix = getDaySuffix(day);

        return `${suffix} ${month}, ${year}`;
    };
    const dateFormat = (dateString) => {
        const [day, month, year] = dateString.split('-').map(Number);
        const date = new Date(year, month - 1, day);
        if (isNaN(date)) {
            return 'Invalid Date';
        }
        const options = { day: 'numeric', month: 'long', year: 'numeric' };
        return date.toLocaleDateString('en-US', options);
    };
    const scheduleDate = (dateString) => {
        const date = new Date(dateString);

        // Get day of the week (e.g., "Friday")
        const dayOfWeek = format(date, 'EEEE');

        // Get day of the month with suffix (e.g., "1st", "2nd", "3rd", "4th", etc.)
        const dayOfMonth = getDaySuffix(date.getDate());

        // Get month name (e.g., "May")
        const month = format(date, 'MMMM');

        // Get full year (e.g., "2023")
        const year = date.getFullYear();

        // Format into "Friday - 1st May, 2023" format
        return `${dayOfWeek} - ${dayOfMonth} ${month}, ${year}`;
    };

    const getDaySuffix = (day) => {
        if (day >= 11 && day <= 13) {
            return `${day}th`;
        }
        switch (day % 10) {
            case 1: return `${day}st`;
            case 2: return `${day}nd`;
            case 3: return `${day}rd`;
            default: return `${day}th`;
        }
    };
    const wordLimit = (input, limit = 50) => {
        // Remove HTML tags using a regex
        const strippedHtml = input.replace(/<[^>]+>/g, '');
        // Split the string into words
        const words = strippedHtml.split(/\s+/);
        // Ensure we limit to the specified number of words
        const limitedWords = words.slice(0, limit);
        // Join the limited words back into a string
        return limitedWords.join(' ');
    };
    const formatTime = (timeString) => {
        const date = new Date(`2000-01-01T${timeString}`);
        return date.toLocaleTimeString([], { hour: 'numeric', minute: '2-digit' });
    };
    const formatNumber = (number) => {
        return number < 10 ? `0${number}` : `${number}`;
    };
    return {
        formatDate, wordLimit, scheduleDate, formatTime, formatNumber, dateFormat
    };
}
