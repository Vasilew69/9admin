interface nineadminHelpData {
  date: Date;
}

const nineadmin_HELP_DATA_KEY = "nineadminHelpData";

const dayInMs = 24 * 60 * 60 * 1000;

export const shouldHelpAlertShow = (): boolean => {
  const rawLocalStorageStr = localStorage.getItem(nineadmin_HELP_DATA_KEY);

  const setNewItemDate = JSON.stringify({ date: new Date() });

  if (rawLocalStorageStr) {
    const data: nineadminHelpData = JSON.parse(rawLocalStorageStr);
    const oneDayAgo = new Date(Date.now() - dayInMs);

    // If the last time message was shown was over a day ago
    if (data.date > oneDayAgo) {
      localStorage.setItem(nineadmin_HELP_DATA_KEY, setNewItemDate);
      return true;
    }

    return false;
  }

  localStorage.setItem(nineadmin_HELP_DATA_KEY, setNewItemDate);
  return true;
};
