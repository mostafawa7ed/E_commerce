double mediaQuereyFun(double myMediaQuery, double persentage, int flag) {
  if (flag == 0) {
    // 0 work on width
    return (myMediaQuery * persentage) / 100;
  } else {
    //  work on hight
    return (myMediaQuery * persentage) / 100;
  }
}
