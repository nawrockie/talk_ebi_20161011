SEQDIR=/panfs/pan1/infernal/notebook/16_0909_talk_infernal_ebi/seqfiles
I1P1P1=/home/nawrocke/src/infernal-1.1.1/src/
I1P1P2=/home/nawrocke/src/infernal-1.1.2/src/
CMFILE=/home/nawrocke/db/rfam/rfam_12.1/Rfam.cm

# 1.1.1
for g in ecol mg1 mg2; do 
    for cpu in 0 1; do 
        qsub -N $g.$cpu.1p1p1.scan -o /dev/null -e $g.$cpu.1p1p1.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $I1P1P1/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmscan"
        qsub -N $g.$cpu.1p1p1.search -o /dev/null -e $g.$cpu.1p1p1.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $I1P1P1/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmsearch"
    done
    for cpu in 2; do
        qsub -N $g.$cpu.1p1p1.scan -o /dev/null -e $g.$cpu.1p1p1.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $I1P1P1/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmscan"
        qsub -N $g.$cpu.1p1p1.search -o /dev/null -e $g.$cpu.1p1p1.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $I1P1P1/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmsearch"
    done
    for cpu in 4; do
        qsub -N $g.$cpu.1p1p1.scan -o /dev/null -e $g.$cpu.1p1p1.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $I1P1P1/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmscan"
        qsub -N $g.$cpu.1p1p1.search -o /dev/null -e $g.$cpu.1p1p1.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $I1P1P1/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmsearch"
    done
    for cpu in 8; do
        qsub -N $g.$cpu.1p1p1.scan -o /dev/null -e $g.$cpu.1p1p1.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $I1P1P1/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmscan"
        qsub -N $g.$cpu.1p1p1.search -o /dev/null -e $g.$cpu.1p1p1.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $I1P1P1/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p1.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p1.cmsearch"
    done
done

# 1.1.2
for g in ecol mg1 mg2; do 
    for cpu in 0 1; do 
        qsub -N $g.$cpu.1p1p2.scan -o /dev/null -e $g.$cpu.1p1p2.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $I1P1P2/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmscan"
        qsub -N $g.$cpu.1p1p2.search -o /dev/null -e $g.$cpu.1p1p2.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $I1P1P2/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmsearch"
    done
    for cpu in 2; do
        qsub -N $g.$cpu.1p1p2.scan -o /dev/null -e $g.$cpu.1p1p2.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $I1P1P2/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmscan"
        qsub -N $g.$cpu.1p1p2.search -o /dev/null -e $g.$cpu.1p1p2.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $I1P1P2/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmsearch"
    done
    for cpu in 4; do
        qsub -N $g.$cpu.1p1p2.scan -o /dev/null -e $g.$cpu.1p1p2.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $I1P1P2/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmscan"
        qsub -N $g.$cpu.1p1p2.search -o /dev/null -e $g.$cpu.1p1p2.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $I1P1P2/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmsearch"
    done
    for cpu in 8; do
        qsub -N $g.$cpu.1p1p2.scan -o /dev/null -e $g.$cpu.1p1p2.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $I1P1P2/cmscan -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmscan"
        qsub -N $g.$cpu.1p1p2.search -o /dev/null -e $g.$cpu.1p1p2.search.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $I1P1P2/cmsearch -Z 10 --verbose --rfam --cpu $cpu --tblout $g.$cpu.1p1p2.cmsearchtbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.cmsearch"
    done
done
