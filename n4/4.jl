
function cross(robot) # side1 = (Nord or Sud), side2 = (West or Ost)
    for side2 in(Ost,West)
        num_steps =  steps_numsteps_putmarker(robot,Nord,side2)
        steps_numsteps_putmarker(robot,Nord,side2)
        go_home(robot,Nord,side2,num_steps)
    end
    for side2 in(Ost,West)
        num_steps =  steps_numsteps_putmarker(robot,Sud,side2)
        steps_numsteps_putmarker(robot,Sud,side2)
        go_home(robot,Sud,side2,num_steps)
    end
    putmarker!(robot)
end

function steps_numsteps_putmarker(robot,side1,side2) #Робот делает шаги "ступенькой" и ставит маркеры, в конце робот
    num_steps = 0                                    #возвращает количество сделанных шагов
    while (!isborder(robot,side1) && !isborder(robot,side2))
        try_move!(robot,side2)
        try_move!(robot,side1)
        putmarker!(robot)
        num_steps += 1 
    end
    return num_steps
end

function try_move!(robot,side)
    if !isborder(robot,side)
        move!(robot,side)
    end
end

function go_home(robot,side1,side2,num_steps)#Робот возвращается в начальную позицию, на основе количества шагов
    for _  in 1:num_steps                    #из фкунции steps_numsteps_putmarker(robot,side1,side2)
        move!(robot,inverse(side1))
        move!(robot,inverse(side2))
    end
end

inverse(side::HorizonSide)::HorizonSide = HorizonSide((Int(side)+2)%4)
