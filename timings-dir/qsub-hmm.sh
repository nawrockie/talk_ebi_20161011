SEQDIR=/panfs/pan1/infernal/notebook/16_0909_talk_infernal_ebi/seqfiles
HMMER1=/home/nawrocke/src/infernal-1.1.2/hmmer/src
HMMER2=/usr/local/hmmer/3.1b2/bin
I1P1P1=/home/nawrocke/src/infernal-1.1.1/src
I1P1P2=/home/nawrocke/src/infernal-1.1.2/src
CMFILE=/home/nawrocke/db/rfam/rfam_12.1/Rfam.cm
HMMFILE=/home/nawrocke/db/rfam/rfam_12.1/Rfam.mlhmm

# 1.1.2
for g in ecol mg1 mg2; do 
    for cpu in 0 1; do 
        qsub -N $g.$cpu.1.hmmscan -o /dev/null -e $g.$cpu.1.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $HMMER1/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmscan"
        qsub -N $g.$cpu.1.hmmsearch -o /dev/null -e $g.$cpu.1.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $HMMER1/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmer"
        qsub -N $g.$cpu.2.hmmscan -o /dev/null -e $g.$cpu.2.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $HMMER2/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmscan"
        qsub -N $g.$cpu.2.hmmsearch -o /dev/null -e $g.$cpu.2.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $HMMER2/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmer"
#        qsub -N $g.$cpu.1p1p2.hmm.scan -o /dev/null -e $g.$cpu.1p1p2.hmm.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=2G,h_vmem=2G -m n "time $I1P1P2/cmscan -Z 10 --verbose --hmmonly --cpu $cpu --tblout $g.$cpu.1p1p2.hmm.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.hmm.cmscan"
    done
    for cpu in 2; do
        qsub -N $g.$cpu.1.hmmscan -o /dev/null -e $g.$cpu.1.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $HMMER1/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmscan"
        qsub -N $g.$cpu.1.hmmsearch -o /dev/null -e $g.$cpu.1.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $HMMER1/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmer"
        qsub -N $g.$cpu.2.hmmscan -o /dev/null -e $g.$cpu.2.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $HMMER2/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmscan"
        qsub -N $g.$cpu.2.hmmsearch -o /dev/null -e $g.$cpu.2.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $HMMER2/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmer"
#        qsub -N $g.$cpu.1p1p2.hmm.scan -o /dev/null -e $g.$cpu.1p1p2.hmm.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=4G,h_vmem=4G -m n -pe multicore $cpu -R y "time $I1P1P2/cmscan -Z 10 --verbose --hmmonly --cpu $cpu --tblout $g.$cpu.1p1p2.hmm.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.hmm.cmscan"
    done
    for cpu in 4; do
        qsub -N $g.$cpu.1.hmmscan -o /dev/null -e $g.$cpu.1.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $HMMER1/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmscan"
        qsub -N $g.$cpu.1.hmmsearch -o /dev/null -e $g.$cpu.1.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $HMMER1/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmer"
        qsub -N $g.$cpu.2.hmmscan -o /dev/null -e $g.$cpu.2.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $HMMER2/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmscan"
        qsub -N $g.$cpu.2.hmmsearch -o /dev/null -e $g.$cpu.2.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $HMMER2/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmer"
#        qsub -N $g.$cpu.1p1p2.hmm.scan -o /dev/null -e $g.$cpu.1p1p2.hmm.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "time $I1P1P2/cmscan -Z 10 --verbose --hmmonly --cpu $cpu --tblout $g.$cpu.1p1p2.hmm.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.hmm.cmscan"
    done
    for cpu in 8; do
        qsub -N $g.$cpu.1.hmmscan -o /dev/null -e $g.$cpu.1.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $HMMER1/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmscan"
        qsub -N $g.$cpu.1.hmmsearch -o /dev/null -e $g.$cpu.1.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $HMMER1/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.1.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1.nhmmer"
        qsub -N $g.$cpu.2.hmmscan -o /dev/null -e $g.$cpu.2.hmmscan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $HMMER2/nhmmscan -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmscantbl $HMMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmscan"
        qsub -N $g.$cpu.2.hmmsearch -o /dev/null -e $g.$cpu.2.hmmsearch.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $HMMER2/nhmmer -Z 10000 --cpu $cpu --tblout $g.$cpu.2.nhmmertbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.2.nhmmer"
#        qsub -N $g.$cpu.1p1p2.hmm.scan -o /dev/null -e $g.$cpu.1p1p2.hmm.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=16G,h_vmem=16G -m n -pe multicore $cpu -R y "time $I1P1P2/cmscan -Z 10 --verbose --hmmonly --cpu $cpu --tblout $g.$cpu.1p1p2.hmm.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.hmm.cmscan"
    done
done
