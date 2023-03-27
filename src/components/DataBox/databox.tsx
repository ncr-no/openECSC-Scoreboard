import * as React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import { MilitaryTech } from '@mui/icons-material';

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
  bold: {
    fontWeight: 'bold',
  },
  bigger: {
    fontSize: '1.5rem',
  },
  gold: {
    color: 'gold',
    fontWeight: 'bold',
    fontSize: '1.3rem'
  },
  silver: {
    color: 'silver',
    fontWeight: 'bold',
    fontSize: '1.3rem'
  },
  bronze: {
    color: '#fcca7e',
    fontWeight: 'bold',
    fontSize: '1rem'
  }
}));

export default function TopUsers({ totalUsers, highestScore, top3Users }: { totalUsers: number, highestScore: number, top3Users: Array<{username: string, points: number}> }) {
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={2}>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5">Total Players</Typography>
            <Typography className={`${classes.bold} ${classes.bigger}`}>{totalUsers}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5">Top Score</Typography>
            <Typography className={`${classes.bold} ${classes.bigger}`}>{highestScore}</Typography>
          </Paper>
        </Grid>
        <Grid item xs={4}>
          <Paper className={classes.paper}>
            <Typography variant="h5">Top 3 Scores</Typography>
            {top3Users.map((user, index) => (
              <Typography key={index} className={index === 0 ? classes.gold : index === 1 ? classes.silver : classes.bronze}>
                {user.username} - {user.points} {index === 0 && <MilitaryTech fontSize="small" />}
              </Typography>
            ))}
          </Paper>
        </Grid>
      </Grid>
    </div>
  );
}
