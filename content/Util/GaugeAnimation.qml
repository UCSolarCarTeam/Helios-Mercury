import QtQuick 2.15
import Mercury

QtObject {
    id: gaugeAnimation

    /* converts degrees to radians */ 
    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180);
    }

    /* ensures gauge animation stays within the bounds of minValue and maxValue */
    function clamp(value, minValue, maxValue) {
        return Math.max(minValue, Math.min(maxValue, value));
    }

    /* computes needle's angle based off the value range and total arc angle. 
    arcBegin and arcEnd are those specified for the Canvas element and not the ArcItem 
    elements; Canvas angles follow unit circle conventions, but in ArcItem angles, 0° 
    is at the top (270° on the unit circle) and increases clockwise */
    function calculateValueAngle(value, minValue, maxValue, arcBegin, arcEnd) {
        var clampedValue = clamp(value, minValue, maxValue);
        var valueRange = maxValue - minValue;
        return arcBegin - ((clampedValue - minValue) / valueRange) * (arcBegin - arcEnd);
    }

    /* draws the gauge's trailing blue arc and needle. Config.primary is the trailing 
    color and Config.btnDisabled is the unfilled gauge color. Needle witdh by default is 
    equal to width of arc, but can passed to the function as the fourth argument to make needle 
    longer/shorter. Needle length by default is 5 units, but can be passed as the fifth argument
    to make needle thicker/thinner. Needle moves clockwise by default, to flip needle's movement
    to counterclockwise, pass true as sixth argument. */
    function drawGauge(canvas, gauge, activeValue, needleWidth = gauge.arcWidth, needleLength = 5, flipped = false) {
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
            flipped
        );
        ctx.stroke();

        ctx.beginPath();
        ctx.lineWidth = needleWidth;
        ctx.strokeStyle = Config.needleColor;
        
        var needleStartAngle, needleEndAngle;
        
        if (flipped) {
            if (Math.abs(valueAngle - gauge.arcBegin) < 1) {
                needleEndAngle = gauge.arcBegin - (needleLength / (2 * Math.PI * arcRadius)) * 360;
                needleStartAngle = needleEndAngle + (needleLength / (2 * Math.PI * arcRadius)) * 360; 
            } else if (Math.abs(valueAngle - gauge.arcEnd) < 1) {
                needleStartAngle = gauge.arcEnd + (needleLength / (2 * Math.PI * arcRadius)) * 360;
                needleEndAngle = needleStartAngle - (needleLength / (2 * Math.PI * arcRadius)) * 360;
            } else {
                needleStartAngle = valueAngle + (needleLength / (2 * Math.PI * arcRadius)) * 180;
                needleEndAngle = valueAngle - (needleLength / (2 * Math.PI * arcRadius)) * 180;
            }
        } else { 
            if (Math.abs(valueAngle - gauge.arcBegin) < 1) {
                needleStartAngle = gauge.arcBegin + (needleLength / (2 * Math.PI * arcRadius)) * 360;
                needleEndAngle = needleStartAngle - (needleLength / (2 * Math.PI * arcRadius)) * 360; 
            } else if (Math.abs(valueAngle - gauge.arcEnd) < 1) {
                needleEndAngle = gauge.arcEnd - (needleLength / (2 * Math.PI * arcRadius)) * 360;
                needleStartAngle = needleEndAngle + (needleLength / (2 * Math.PI * arcRadius)) * 360;
            } else {
                needleStartAngle = valueAngle + (needleLength / (2 * Math.PI * arcRadius)) * 180;
                needleEndAngle = valueAngle - (needleLength / (2 * Math.PI * arcRadius)) * 180;
            }
        }

        var needleRadius = arcRadius - (needleWidth / 2);

        ctx.arc(
            arcRadius,
            arcRadius,
            needleRadius,
            degreesToRadians(needleStartAngle),
            degreesToRadians(needleEndAngle),
            true
        );
        ctx.stroke();
    }

    /* requests a repaint of the canvas to refresh the gauge display as the value changes */
    function requestRepaint(canvas) {
        if (canvas) {
            canvas.requestPaint();
        }
    }

    /* defines font sizes to be used on the gauge depending on the gauge's size */
    function getFontSizes(gaugeSize) {
        if (gaugeSize === Config.largeGaugeSize) {
            return {
                l: "gaugeFontSizeXL",
                m: "gaugeFontSizeL",
                s: "gaugeFontSizeS"
            };
        } else if (gaugeSize === Config.mediumGaugeSize) {
            return {
                l: "gaugeFontSizeL",
                m: "gaugeFontSizeM",
                s: "gaugeFontSizeS"
            };
        } else if (gaugeSize === Config.smallGaugeSize) {
            return {
                l: "gaugeFontSizeM",
                m: "gaugeFontSizeS",
                s: "gaugeFontSizeXS"
            };
        } else if (gaugeSize === Config.extraSmallGaugeSize) {
            return {
                l: "gaugeFontSizeS",
                m: "gaugeFontSizeXS",
                s: "gaugeFontSizeXXS"
            };
        } else {
            return null;
        }
    }
}
