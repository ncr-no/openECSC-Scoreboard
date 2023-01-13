import * as React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
    marginTop: theme.spacing(5),
  },
  paper: {
    padding: theme.spacing(5),
    textAlign: 'center',
    color: '#fff',
    height: '100%',
    backgroundColor: '#2196f3',
    
  },
}));

export default function TopUsers({ totalUsers, highestScore, top3Users }: { totalUsers: number, highestScore: number, top3Users: Array<{name: string, score: number}> }) {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={2}>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5">Total Players</Typography>
            <Typography>{totalUsers}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5">Highest Score</Typography>
            <Typography>{highestScore}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5">Top 3 Scores</Typography>
            {top3Users.map((user, index) => (
            <Typography key={index}>{user.name} - {user.score}</Typography>
            ))}
          </Paper>
        </Grid>
      </Grid>
    </div>
);
}

