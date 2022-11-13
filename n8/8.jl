function spiral(robot)
    a = true
    side = West
    n_steps = 1
    check_steps = 0
    while a 
        side = right(side)
        for _  in 1:n_steps
            move!(robot,side)
            if ismarker(robot)
                a = false
                return
            end
        end
        check_steps += 1
        if check_steps % 2 == 0
            n_steps += 1
        end
    end
end
#=
function spiral(robot)
    side = West
    num_steps = 1
    check_steps = 0
    a = true
    while a
        side = right(side)
        for i in 1:num_steps
            move!(robot,side)
            if ismarker(robot)
                a = false
                break
            end
        end
        check_steps +=1
        if check_steps%2==0
            num_steps +=1
        end
    end

end
=#
right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) - 1 , 4)) 