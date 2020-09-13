% This example generates a tiling instance and tries to solve it with
% simulated annealing.

clear;
addpath(genpath('..'));

% Tiling Parameters
sz = [6 6 6]; % 6x6x6 3D lattice
N = prod(sz);
flist = [0 0 0 0 1]; % tiling parameters
fRBM = false; % non-RBM structure
fwolff = false; % no wolff updates
fkbd = false; % no KBD updates
quiet = false;

% SA Parameters
beta = [0.01 log(N)]; % inverse temperature schedule
T = 2^15; % total simulation time
t0 = 10; % restart after 2^10 sweeps

fprintf('Generating instance...');
fprintf('\n');
[W,Esol] = tiling(sz,flist); % generates instance

% solves instance and
% returns best energy found as 'Ebest', and TTS as 't'
fprintf('Solving instance');
[t,Ebest] = SA(beta,t0,Esol,W,fRBM,fwolff,fkbd,T,quiet);
fprintf('\n');
fprintf(strcat('TTS: ', num2str(t), ' sweeps'));