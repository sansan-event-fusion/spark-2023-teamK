export const getNowDate = (): string => {
  let now = new Date();

  // 年月日と時分秒を分けて取得する
  let year: string | number = now.getFullYear();
  let month: string | number = now.getMonth() + 1; // 0から11までの値が返るので、1を足す
  let date: string | number = now.getDate();
  let hour: string | number = now.getHours();
  let minute: string | number = now.getMinutes();
  let second: string | number = now.getSeconds();
  let millisecond: string | number = now.getMilliseconds();

  // 月、日、時、分、秒、ミリ秒が一桁の場合は、先頭に0を付ける
  month = month < 10 ? "0" + month : month;
  date = date < 10 ? "0" + date : date;
  hour = hour < 10 ? "0" + hour : hour;
  minute = minute < 10 ? "0" + minute : minute;
  second = second < 10 ? "0" + second : second;
  millisecond = millisecond < 100 ? "0" + millisecond : millisecond;

  // フォーマットに合わせて文字列に結合する
  let dateString =
    year +
    "-" +
    month +
    "-" +
    date +
    "T" +
    hour +
    ":" +
    minute +
    ":" +
    second +
    "." +
    millisecond;

  return dateString;
};
