classdef one_sample_ttest_result
    %
    %   Class:
    %   stats.tests.r.one_sample_ttest_result
    %
    %   See Also
    %   --------
    %   stats.tests.one_sample_ttest
    %
    %   Examples
    %   --------
    %   mu = 1;
    %   sigma = 1;
    %   data = normrnd(mu,sigma,1,20);
    %   result = stats.tests.one_sample_ttest(data);

    properties
        d1 = '---- options ----'
        dim
        alpha
        tail
        null_mean = 0

        d2 = '---- results ----'
        h
        p
        ci

        t_statistic
        dof
        mean
        standard_deviation

        conclusion
    end

    methods
        function obj = one_sample_ttest_result(data,varargin)
            %If numeric 

            if ~isempty(varargin) && isnumeric(varargin{1})
                obj.null_mean = varargin{1};
            else
                obj.null_mean = 0;
            end
            [obj.h,obj.p,obj.ci,stats2] = ttest(data,obj.null_mean,varargin{:});

            s = struct('dim',[],'alpha',0.05,'tail','both');
            s = stats.utils.getOptions(s,varargin);

            obj.t_statistic = stats2.tstat;
            obj.dof = stats2.df;
            obj.standard_deviation = stats2.sd;
            if isempty(s.dim)
                obj.mean = mean(data,'omitnan');
            else
                obj.mean = mean(data,s.dim,'omitnan');
            end

            obj.dim = s.dim;
            obj.alpha = s.alpha;
            obj.tail = s.tail;

            %if obj.p < obj.alpha
            %    str = sprintf('Stiatistically significant difference in mean relative to null:%g (P=%g)')

        end
    end
end