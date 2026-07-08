# 🍢 미니 떡볶이 타이쿤 3D — Firebase Studio (구 Project IDX) 환경 설정
# 이 파일이 있으면 studio.firebase.google.com 에서 저장소를 열었을 때
# 자동으로 개발 서버 + 웹 미리보기 패널이 구성됩니다.
{ pkgs, ... }: {
  channel = "stable-24.05";

  # 정적 서버용 파이썬 + 클로드코드 설치용 Node.js
  packages = [
    pkgs.python3
    pkgs.nodejs_20
  ];

  idx = {
    extensions = [ ];

    # 우측 미리보기 패널: 게임을 바로 띄워줌
    previews = {
      enable = true;
      previews = {
        web = {
          command = [ "python3" "-m" "http.server" "$PORT" "--bind" "0.0.0.0" ];
          manager = "web";
        };
      };
    };

    workspace = {
      # 워크스페이스 최초 생성 시 클로드코드 CLI 자동 설치
      onCreate = {
        install-claude = "npm install -g @anthropic-ai/claude-code";
      };
    };
  };
}
