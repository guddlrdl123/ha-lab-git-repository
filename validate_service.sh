#!/bin/bash
sleep 3
STATUS=$(curl -s -o /dev/null -w '%{http_code}' http://localhost/health)
if [ "$STATUS" = "200" ]; then
 echo "✅ 검증 성공: HTTP $STATUS"
 exit 0
else
 echo "❌ 검증 실패: HTTP $STATUS"
 exit 1
fi
# 실행 권한 부여 (로컬에서 실행)
chmod +x scripts/*.sh
git add scripts/ appspec.yml
git commit -m 'add: CodeDeploy 배포 스크립트 추가'
git push origin main
