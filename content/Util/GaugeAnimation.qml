import QtQuick 2.15
import Mercury

QtObject {
    id: gaugeAnimation

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180);
    }

    function clamp(value, minValue, maxValue) {
        return Math.max(minValue, Math.min(maxValue, value));
    }

    function calculateValueAngle(value, minValue, maxValue, arcBegin, arcEnd) {
        var clampedValue = clamp(value, minValue, maxValue);
        var valueRange = maxValue - minValue;
        return arcBegin - ((clampedValue - minValue) / valueRange) * (arcBegin - arcEnd);
    }

    function drawGauge(canvas, gauge, activeValue, needleWidth = gauge.arcWidth) {
        var ctx = canvas.getContext("2d");
        ctx.reset();

        var arcRadius = canvas.width / 2;
        var valueAngle = calculateValueAngle(
            activeValue,
            gauge.minValue,
            gauge.maxValue,
            gauge.arcBegin,
            gauge.arcEnd
        );

        ctx.beginPath();
        ctx.lineWidth = gauge.arcWidth;
        ctx.strokeStyle = Config.primary;
        ctx.arc(
            arcRadius,
            arcRadius,
            arcRadius - gauge.arcWidth / 2,
            degreesToRadians(gauge.arcBegin),
            degreesToRadians(valueAngle),
            false
        );
        ctx.stroke();

        ctx.beginPath();
        ctx.lineWidth = needleWidth;
        ctx.strokeStyle = Config.needleColor;
        ctx.arc(
            arcRadius,
            arcRadius,
            arcRadius - gauge.arcWidth / 2,
            degreesToRadians(valueAngle - 3),
            degreesToRadians(valueAngle),
            false
        );
        ctx.stroke();
    }
    function requestRepaint(canvas) {
        if (canvas) {
            canvas.requestPaint();
        }
    }
}
