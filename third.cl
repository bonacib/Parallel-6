kernel
void
ArrayMultReduction( global const float *dA, global const float *dB, local float * products, global float *dC )
{
	int gid = get_global_id( 0 );
	int numitems = get_local_size( 0 );
	int threadnum = get_local_id(0);
	int workgroupNum = get_group_id(0);
	products[threadnum] = dA[gid]*dB[gid];

	for( int offset = 1; offset < numitems; offset *= 2){
		int mask = 2* offset - 1;
		barrier( CLK_LOCAL_MEM_FENCE);
		if( (threadnum & mask) == 0){
			products[threadnum] += products[threadnum + offset];
		}
	}

	barrier(CLK_LOCAL_MEM_FENCE);
	if(threadnum == 0){
		dC[workgroupNum] = products[0];
	}
}
