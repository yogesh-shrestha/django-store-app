function CartItemList() {
    return ( 
        <Grid height="80vh">
            <Paper 
                elevation={10} 
                lg={12}
                sx={{p:2, height: 'auto', lg: 12, ml: 'auto', mr: 'auto' }}
            >
                    
                    <Grid container spacing={2}>
                        <Grid item xs={8}>
                            <Item>xs=8</Item>
                        </Grid>
                        <Grid item xs={4}>
                            <Item>xs=4</Item>
                        </Grid>
                    </Grid>


                    
            </Paper>
        </Grid>


     );
}

export default CartItemList;