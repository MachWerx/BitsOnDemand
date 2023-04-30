#ifndef SHADERFUNCTIONS_INCLUDED
#define SHADERFUNCTIONS_INCLUDED

void Grid_float(float2 UV, float2 Ddxy, out float3 _out) {
    float gridX = abs((_Grid_Size * UV.x) % 1 - 0.5);
    gridX = smoothstep(0.5 - 2 * _Grid_Size * Ddxy.x, 0.5, gridX);
    float gridY = abs((_Grid_Size * UV.y) % 1 - 0.5);
    gridY = smoothstep(0.5 - 2 * _Grid_Size * Ddxy.y, 0.5, gridY);
    float grid = max(gridX, gridY) / (1 + 10 * (_Grid_Size * Ddxy.x + _Grid_Size * Ddxy.y));
    _out = _Intensity * _Grid_Color * grid;
}

#endif