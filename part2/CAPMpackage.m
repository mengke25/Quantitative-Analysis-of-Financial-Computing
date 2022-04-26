load CAPMuniverse 
whos Assets Data Dates
Assets(1:7)
Assets(8:14)
[NumSamples, NumSeries] = size(Data);
NumAssets = NumSeries - 2;

StartDate = Dates(1);
EndDate = Dates(end);

fprintf(1,'Separate regressions with ');
fprintf(1,'daily total return data from %s to %s ...\n', ...
		datestr(StartDate,1),datestr(EndDate,1));
fprintf(1,'  %4s %-20s %-20s %-20s\n',' ','Alpha','Beta','Sigma');
fprintf(1,'  ---- -------------------- ');
fprintf(1,'-------------------- --------------------\n');

for i = 1:NumAssets
	% Set up separate asset data and design matrices
	TestData = zeros(NumSamples,1);
	TestDesign = zeros(NumSamples,2);

	TestData(:) = Data(:,i) - Data(:,14);
	TestDesign(:,1) = 1.0;
	TestDesign(:,2) = Data(:,13) - Data(:,14);

	% Estimate CAPM for each asset separately
	[Param, Covar] = ecmmvnrmle(TestData, TestDesign);

	% Estimate ideal standard errors for covariance parameters
	[StdParam, StdCovar] = ecmmvnrstd(TestData, TestDesign, Covar, 'fisher');
	
	% Estimate sample standard errors for model parameters
	StdParam = ecmmvnrstd(TestData, TestDesign, Covar, 'hessian');

	% Set up results for output
	Alpha = Param(1);
	Beta = Param(2);
	Sigma = sqrt(Covar);

	StdAlpha = StdParam(1);
	StdBeta = StdParam(2);
	StdSigma = sqrt(StdCovar);

	% Display estimates
	fprintf('  %4s %9.4f (%8.4f) %9.4f (%8.4f) %9.4f (%8.4f)\n', ...
		Assets{i},Alpha(1),abs(Alpha(1)/StdAlpha(1)), ...
		Beta(1),abs(Beta(1)/StdBeta(1)),Sigma(1),StdSigma(1));
end
openExample('finance/capmdemo')