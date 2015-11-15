#!/bin/sh
# Hay que hacerlo lindo a esto. Por ahora, totalmente AD-HOC
printf '\n\n> SMT MATRIX <' >> smt-matrix-complexities.out
date >> smt-matrix-complexities.out

# Sin poyección ni sampling
echo '> Comienza Sin proyec ni sampling'
echo '> Comienza choice.xes'
./pach.py ../xes_logs/choice.xes --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza confDimBlocking.xes'
./pach.py ../xes_logs/confDimBlocking.xes --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza DriversLicense.xes'
./pach.py ../xes_logs/DriversLicense.xes --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza confDimStacked.xes'
./pach.py ../xes_logs/confDimStacked.xes --smt-matrix 300 >> smt-matrix-complexities.out

# Con poyección y/o sampling
echo ''
echo '> Comienza Con proyec y/o sampling'
echo '> Comienza log1.xes'
./pach.py ../xes_logs/log1.xes --projection 11 --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza a32.xes'
./pach.py ../xes_logs/a32.xes --projection 8 --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza DatabaseWithMutex-PT-02.xes'
./pach.py ../xes_logs/DatabaseWithMutex-PT-02.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza cycles5_2.xes'
./pach.py ../xes_logs/cycles5_2.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza a42.xes'
./pach.py ../xes_logs/a42.xes --projection 10 --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza t32.xes'
./pach.py ../xes_logs/t32.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza Peterson-PT-2.xes'
./pach.py ../xes_logs/Peterson-PT-2.xes --projection 10 --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza telecom.xes'
./pach.py ../xes_logs/telecom.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza complex.enc.xes'
./pach.py ../xes_logs/complex.enc.xes --projection 10 --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza documentflow.xes'
./pach.py ../xes_logs/documentflow.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza FHMexampleN5.enc.xes'
./pach.py ../xes_logs/FHMexampleN5.enc.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza incident.xes'
./pach.py ../xes_logs/incident.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza receipt.xes'
./pach.py ../xes_logs/receipt.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
echo '> Comienza svn.xes'
./pach.py ../xes_logs/svn.xes --projection --smt-matrix 300 >> smt-matrix-complexities.out
mv ../xes_logs/*.pnml ../pnml/smt_matrix/
