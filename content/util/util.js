function mapValueToAngle(val) {
    let minAngle = -135; // Adjust based on your arc
    let maxAngle = 135;  // Adjust based on your arc
    let normalizedValue = (val - minValue) / (maxValue - minValue);
    return minAngle + normalizedValue * (maxAngle - minAngle);
}
