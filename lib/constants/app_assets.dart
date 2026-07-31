class AppAssets{
  // static final String _story_default_01 = 'asset/image/story_default/01_rainy.png';
  // static final String _story_default_02 = 'asset/image/story_default/02_family.png';
  // static final String _story_default_03 = 'asset/image/story_default/03_study.png';

  // static final Map story_images = {
  //   0:_story_default_01,
  //   1:_story_default_02,
  //   2:_story_default_03
  // };
  //
  // static final String frequency_background = 'asset/image/background/frequency_background.png';
  //
  // static final String default_profile_image = 'asset/image/profile/default_profile_image.png';

  // static final String logo_google = 'asset/image/logo/google_logo.png';
  //
  // static final String signin_background = 'asset/image/background/night_castle.jpg';
  //
  // static final String splash_background = 'asset/image/background/night_forest.jpg';

  static const String IMG_MY_PROFILE = 'assets/images/common/my_profile.jpg';

  /// 3색 팔레트 GIF.
  /// 무손실 WebP(VP8L)로 바꿨더니 용량은 19% 줄었지만 프레임당 디코드 비용이
  /// 몇 배로 올라 모바일에서 프레임이 떨어졌다. 팔레트 디코딩이 훨씬 싸서 GIF 유지.
  static const String BG_EARTH_ANIM = 'assets/images/backgrounds/cyber_earth_animation.gif';

  /// BG_EARTH_ANIM 의 첫 프레임만 담은 정지 이미지.
  /// 용량이 큰 애니메이션을 내려받는 동안 자리를 채우는 용도.
  static const String BG_EARTH_POSTER = 'assets/images/backgrounds/cyber_earth_poster.webp';
  static const String BG_WHITE_STARS = 'assets/images/backgrounds/white_stars.png';
  static const String BG_IMAGE_BACKGROUND_POLYGON = 'assets/images/backgrounds/image_background_polygon.png';


  static const String SVG_FLUTTER = 'assets/vectors/flutter.svg';
  static const String SVG_TISTORY = 'assets/vectors/tistory.svg';
  static const String SVG_GITHUB = 'assets/vectors/github.svg';

  static const String JSON_SKILL_DETAILS = 'assets/jsons/skill_descriptions.json';
  static const String JSON_PROJECTS = 'assets/jsons/projects.json';

}