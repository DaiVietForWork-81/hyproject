@echo off
chcp 65001 >nul
title Orbit | Vietnam - 1-Click Sync & Deploy (Web + Bot)

echo ============================================================
echo   ORBIT ^| VIETNAM — ĐỒNG BỘ 2 CHIỀU BOT ^<--^> WEB (VERCEL)
echo ============================================================

echo.
echo [1/4] Đang đẩy bản cập nhật Web lên GitHub (Hyperhub -^> Vercel)...
git -C "%~dp0Web" push origin main
if %ERRORLEVEL% NEQ 0 (
    echo [!] Cảnh báo: Không thể push Web, vui lòng kiểm tra kết nối mạng/GitHub.
) else (
    echo [OK] Đã push Web lên https://github.com/DaiVietForWork-81/Hyperhub (Vercel đang tự động deploy https://orbit-psi-black.vercel.app/)
)

echo.
echo [2/4] Đang đẩy bản cập nhật Bot lên GitHub (hyperhub-bot)...
git -C "%~dp0Bot" push origin main

echo.
echo [3/4] Đang đẩy bản cập nhật Backend lên GitHub (hyperhub-backend)...
git -C "%~dp0" push origin main

echo.
echo [4/4] Đang khởi động lại Discord Bot để kích hoạt cầu nối đồng bộ 2 chiều...
call "%~dp0restart_bot_only.bat"

echo.
echo ============================================================
echo   HOÀN TẤT ĐỒNG BỘ BOT ^<--^> WEB!
echo   - Web Live: https://orbit-psi-black.vercel.app/
echo   - Bot Bridge: http://127.0.0.1:8080/api/status
echo ============================================================
pause
