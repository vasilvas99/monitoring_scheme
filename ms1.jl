function get_interstep_distances(step_positions::Vector{Float64})
    # all distances are normalized to the initial vicinal distance $l_0$
    n = length(step_positions)
    step_distances = zeros(n)
    for i in 2:n
        step_distances[i] = step_positions[i] - step_positions[i-1]
    end
    step_distances[1] = step_positions[1] - step_positions[n] + n
    return step_distances
end

function find_bunches(step_distances::Vector{Float64}, bunch_def::Float64)
    bunch_h = 0.0
    bunch_w = 0.0
    terrace_w = 0.0
    terrace_num = 0

    for distance in step_distances
        if distance <= bunch_def # if true we are in a bunch
            bunch_h += 1.0
            bunch_w += distance
        else # otherwise we are on a terrace
            terrace_w = terrace_w + distance
            terrace_num += 1
        end
    end
    avg_terrace_w = terrace_w / terrace_num

    return avg_terrace_w
end

function count_terraces(step_distances::Vector{Float64}, bunch_def::Float64)
    num_terraces = step_distances[1] > bunch_def ? 1 : 0
    # continue ...
end

function ms1(step_positions::Vector{Float64})
    step_distances = get_interstep_distances(step_positions)
end

function main()
    a = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]
    println(get_interstep_distances(a))
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end