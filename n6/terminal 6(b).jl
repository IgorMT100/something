julia '''
using HorizonSideRobots

mutable struct Coordinates
    x::Int
    y::Int
end

function HorizonSideRobots.move!(coord::Coordinates, side::HorizonSide)
    if side==Nord
        coord.y += 1
    elseif side==Sud
        coord.y -= 1
    elseif side==Ost
        coord.x += 1
    elseif side==West
        coord.x -= 1
    end
end

get_coord(coord::Coordinates) = (coord.x, coord.y)

struct CoordRobot
    robot::Robot
    coord::Coordinates
end

function HorizonSideRobots.move!(robot::CoordRobot, side)
    move!(robot.robot, side)
    move!(robot.coord, side)
end

HorizonSideRobots.isborder(robot::CoordRobot,side) isborder(robot.robot, side)
HorizonSideRobots.putmarker!(robot::CoordRobot)=putmarker!(robot.robot)
HorizonSideRobots.ismarker(robot::CoordRobot) = ismarker(robot.robot)

get_coord(robot::CoordRobot) = get_coord(robot.coord)

r = CoordRobot(Robot(animate=true),Coordinates(0,0))

include("6(b).jl")

six!(r)