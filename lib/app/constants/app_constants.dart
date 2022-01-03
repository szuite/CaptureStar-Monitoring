
class AppConstants {
  AppConstants._();

  // 추후 적용
  static final titleName = [
    'Home', '발전 현황', '기상 정보', '변환 통계'
  ];

  static final subtitleName = [
    '발전현황 요약', '기상정보 요약', '변환통계 요약'
  ];

  static final settingMenu = [
    '안내사항', '푸시알림 설정', '차트 설정', '고객센터'
  ];

  static final pushAlarmMenu = [
    '발전량 저하 의심 알림', '변환효율 저하 의심 알림'
  ];

  static final chartSettingMenu = [
    '인버터별 발전량', '기간별 발전량', '커스텀 콤보 차트'
  ];

  // 발전현황
  static const developmentStatus = '발전 현황';

  static const pwrGenerationByInverter = '인버터별 발전량';
  static const pwrGenerationByPeriod = '기간별 발전량';
  static const customComboChart = '커스텀 콤보 차트';

  // 기상정보
  static const weatherInformation = '기상 정보';

  static const insolation = '일사량';

  static const insolationByPeriod = '기간별 일사량';
  static const tempByPeriod = '기간별 온도';
  static const humidityByPeriod = '기간별 습도';
  static const windByPeriod = '기간별 풍향 풍속';

  static final climateSettingMenu = [
    insolationByPeriod, tempByPeriod, humidityByPeriod, windByPeriod
  ];

  static final conversionSettingMenu = [
    '일별 변환 효율', '기간별 변환 효율'
  ];
}