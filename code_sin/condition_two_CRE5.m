function result = condition_two_CRE5(y, z, x)
    nsample = length(x);
    x_edges = linspace(min(x), max(x), 20); % x的分组边界
    z_edges = linspace(min(z), max(z), 20); % z的分组边界
    
    hh = []; % 用于存储每个组的CRE
    
    % 遍历每个x和z的分组范围
    for i = 1:(length(x_edges)-1)
        for j = 1:(length(z_edges)-1)
            % 创建逻辑索引掩码以选择当前组
            mask = (x >= x_edges(i) & x < x_edges(i+1)) & ...
                   (z >= z_edges(j) & z < z_edges(j+1));
            % 应用掩码选择y的子集
            y_subset = y(mask);
            P = length(y_subset)/nsample;
            % 计算当前组的累积剩余熵并添加到结果列表
            if ~isempty(y_subset)
                hh(end+1) = cumu_res_entropy(y_subset)*P; % 假设这是一个预定义的函数
            end
        end
    end
    
    % 计算所有组的累积剩余熵的平均值
    result = sum(hh);
end

% 需要定义或提供 cumu_res_entropy 函数的实现细节。
