
function perimeter(robot)
    num_steps_Sud, num_steps_West = go_corner(robot)
    go_corner(robot)
    for side in(Ost,Nord,West,Sud)
        along_and_putmarker!(robot,side)
    end
    go_home(robot,num_steps_Sud, num_steps_West)
end


function along_and_putmarker!(robot,side)
    while !isborder(robot,side)
        move!(robot,side)
        putmarker!(robot)
    end
end

function along_and_numsteps(robot,side)
    num_steps = 0
    while !isborder(robot,side)
        move!(robot,side)
        num_steps +=1 
    end
    return num_steps
end

function along!(robot,side,num_steps)
    for _ in 1:num_steps
        move!(robot,side)
    end
end

function go_corner(robot) #Робот перемещается в Юго-Западный угол и возращает кол-во шагов, пройденных на Юг и Запад
    num_steps_West = along_and_numsteps(robot,West)
    along_and_numsteps(robot,West)
    num_steps_Sud = along_and_numsteps(robot,Sud)
    along_and_numsteps(robot,Sud)
    return num_steps_Sud, num_steps_West
end

function go_home(robot,num_steps_Sud,num_steps_West) #Робот возвращается в исходоное положение из Юго-Западного угла
    along!(robot,Nord,num_steps_Sud)                 # через количество шагов из функции go_corner(robot)
    along!(robot,Ost,num_steps_West)
end
