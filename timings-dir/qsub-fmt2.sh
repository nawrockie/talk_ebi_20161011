SEQDIR=/panfs/pan1/infernal/notebook/16_0909_talk_infernal_ebi/seqfiles
I1P1P1=/home/nawrocke/src/infernal-1.1.1/src/
I1P1P2=/home/nawrocke/src/infernal-1.1.2/src/
CMFILE=/home/nawrocke/db/rfam/rfam_12.1/Rfam.cm
CLANFILE=/home/nawrocke/db/rfam/rfam_12.1/rfam.claninfo
# 1.1.2
for g in ecol mg1 mg2; do 
    for cpu in 4; do
#        qsub -N $g.$cpu.1p1p2.fmt2.clan.scan -o /dev/null -e $g.$cpu.1p1p2.fmt2.clan.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "$I1P1P2/cmscan -Z 10 --rfam --cpu $cpu --clanin $CLANFILE --fmt 2 --tblout $g.$cpu.1p1p2.fmt2.clan.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.fmt2.clan.cmscan"
        qsub -N $g.$cpu.1p1p2.fmt2.oclan.scan -o /dev/null -e $g.$cpu.1p1p2.fmt2.oclan.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "$I1P1P2/cmscan -Z 10 --rfam --cpu $cpu --oclan --clanin $CLANFILE --fmt 2 --tblout $g.$cpu.1p1p2.fmt2.oclan.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.fmt2.oclan.cmscan"
#        qsub -N $g.$cpu.1p1p2.fmt2.scan -o /dev/null -e $g.$cpu.1p1p2.fmt2.scan.err -b y -cwd -V -v SGE_FACILITIES -P unified -S /bin/bash -j n -l h_rt=288000,mem_free=8G,h_vmem=8G -m n -pe multicore $cpu -R y "$I1P1P2/cmscan -Z 10 --rfam --cpu $cpu --fmt 2 --tblout $g.$cpu.1p1p2.fmt2.cmscantbl $CMFILE $SEQDIR/$g.fa > $g.$cpu.1p1p2.fmt2.cmscan"
    done
done
