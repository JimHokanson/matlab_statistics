function output = one_sample_ttest(data,varargin)
%x One-sample t-test
%
%   Calling Forms
%   -------------
%   output = stats.tests.one_sample_ttest(data,varargin)
%
%   output = stats.tests.one_sample_ttest(data,null_mean,varargin)
%
%   Inputs
%   ------
%   data :
%       Vector OR matrix of data.
%
%   Optional Inputs
%   ---------------
%   null_mean : default 0
%       The mean to compare your data to. By default we compare to
%       a null value of 0.
%   alpha : default 0.05
%       A value ALPHA between 0 and 1 specifying the
%       significance level as (100*ALPHA)%. Default is
%       0.05 for 5% significance.
%   dim : 
%       Dimension DIM to work along. For example, specifying
%       'dim' as 1 tests the column means. Default is the
%        first non-singleton dimension.
%   tail : 'both','right','left'
%       Default is 'both'
%       Based on the tail, the alternative hypothesis is:
%       'both'  -- mean is not equal to null_mean (two-tailed test)
%       'right' -- mean is greater than null_mean (right-tailed test)
%       'left'  -- mean is less than M (left-tailed test)

    output = stats.tests.r.one_sample_ttest_result(data,varargin{:});

end