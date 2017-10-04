%AW. see comments below. 0.9/1.


%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
seq1 = randseq(100); 
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
seq2 = [seq1(1:40) randseq(20) seq1(60:100)];

% C. run swalign on the two sequences with the default parameters
[score, align, start] = swalign(seq1, seq2, 'Alphabet', 'nt', 'Showscore', true);
align
start

% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 
[score_hg, align_hg, start_hg] = swalign(seq1, seq2, 'Alphabet', 'nt', 'GapOpen', 15, 'Showscore', true);
align_hg
start_hg
[score_lg, align_lg, start_lg] = swalign(seq1, seq2, 'Alphabet', 'nt', 'GapOpen', 1, 'Showscore', true);
align_lg
start_lg

% Yu Ouyang explanation: When running with a higher value of the GapOpen
% parameter, the gap penalty becomes high and thus it would be less likely
% to have a relatively long gap in the align result. On the other hand, the 
% lower value of the GapOpen parameter permits a long gap exsiting. Therefore, 
% in the middle of align results, swalign with a low GapOpen would be more
% continuous than the that with a high GapOpen. This is why the middle twenty
% basepairs on the high GapOpen graph is scattering.

%AW: mostly correct but note when GapOpen is high it forces mismatches. When low, it puts in gaps instead. -0.05.

% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
[score_E, align_E, start_E] = swalign(seq1, seq2, 'Alphabet', 'nt', 'GapOpen', 1, 'Extendgap', 15, 'Showscore', true);
align_E
start_E

% Yu Ouyang explanation: The line becomes more continuous when adding a high
% value of ExtendGap to the low-GapOpen swalign. It is because matlab
% scores the first gap with GapOpen value, and the rest gap with ExtendGap. This
% means it could have a large first gap, since the first gap penalty is
% low. However, the subsequent gaps are not likely to be large gaps, since
% the gap penalty becomes high with the ExtendGap value. 

%AW: this is quite correct. Every gap is treated the same. The difference is that the gaps will be short since
%every base pair after the first is penalized more. -0.05. 

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 
[score_le, align_le, start_le] = swalign(seq1, seq2, 'Alphabet', 'nt', 'Extendgap', 1, 'Showscore', true);
align_le
start_le

% Yu Ouyang explanation: Since the subsequent gaps after the first one is
% scored by the Extendgap value, the subsequent gaps can be large gaps.
% Therefore, we could observe the same gap for the first gap, but larger
% gaps later. Overall, the figure with the loe GapOpen value is less
% continuous than the default one. 

%AW: same comment as above, this is about basepairs in the same gap. Not abot the first vs second. 
