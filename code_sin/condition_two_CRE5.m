function result = condition_two_CRE5(y, z, x)
    nsample = length(x);
    x_edges = linspace(min(x), max(x), 20); % x�ķ���߽�
    z_edges = linspace(min(z), max(z), 20); % z�ķ���߽�
    
    hh = []; % ���ڴ洢ÿ�����CRE
    
    % ����ÿ��x��z�ķ��鷶Χ
    for i = 1:(length(x_edges)-1)
        for j = 1:(length(z_edges)-1)
            % �����߼�����������ѡ��ǰ��
            mask = (x >= x_edges(i) & x < x_edges(i+1)) & ...
                   (z >= z_edges(j) & z < z_edges(j+1));
            % Ӧ������ѡ��y���Ӽ�
            y_subset = y(mask);
            P = length(y_subset)/nsample;
            % ���㵱ǰ����ۻ�ʣ���ز���ӵ�����б�
            if ~isempty(y_subset)
                hh(end+1) = cumu_res_entropy(y_subset)*P; % ��������һ��Ԥ����ĺ���
            end
        end
    end
    
    % ������������ۻ�ʣ���ص�ƽ��ֵ
    result = sum(hh);
end

% ��Ҫ������ṩ cumu_res_entropy ������ʵ��ϸ�ڡ�
