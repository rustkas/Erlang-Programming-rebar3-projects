-module(shapes).

-export([perimeter/1, area/1]).
-include("shapes.hrl").

perimeter(C) when is_record(C, circle) ->
	Perimeter = 2 * math:pi() * C#circle.radius,
	round_00(Perimeter);
perimeter(R) when is_record(R, rectangle) ->
	Perimeter = (2 *  R#rectangle.width) * (2 * R#rectangle.length),
	round_00(Perimeter);
perimeter(T) when is_record(T, triangle) ->
	Perimeter = T#triangle.sideA + T#triangle.sideB + T#triangle.sideC,
	round_00(Perimeter).

area(C) when is_record(C, circle) ->
	Area = math:pi() * math:pow(C#circle.radius,2),
	round_00(Area);
area(R) when is_record(R, rectangle) ->
	Area = R#rectangle.width * R#rectangle.length,
	round_00(Area);
area(T) when is_record(T, triangle) ->
	Perimeter = T#triangle.sideA + T#triangle.sideB + T#triangle.sideC,
	HalfPerimeter = Perimeter / 2,
	SideA = HalfPerimeter - T#triangle.sideA,
	SideB = HalfPerimeter - T#triangle.sideB,
	SideC = HalfPerimeter - T#triangle.sideC,
	Area = math:sqrt(HalfPerimeter * SideA * SideB * SideC),
	round_00(Area).
	
% round value to #.##
round_00(Value) -> round(Value*100)/100.
	